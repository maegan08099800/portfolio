import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedTechBackground extends StatefulWidget {
  final Widget child;
  final bool enabled;

  const AnimatedTechBackground({
    super.key,
    required this.child,
    this.enabled = true,
  });

  @override
  State<AnimatedTechBackground> createState() => _AnimatedTechBackgroundState();
}

class _AnimatedTechBackgroundState extends State<AnimatedTechBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Offset _pointer = const Offset(-9999, -9999);
  Offset _lastPointer = const Offset(-9999, -9999);
  Offset _pointerVelocity = Offset.zero;
  bool _hasPointer = false;

  final List<_Node> _nodes = [];
  final List<_Atom> _atoms = [];
  final List<_TrailParticle> _trail = [];
  final Random _rng = Random();

  Size _lastSize = Size.zero;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 20000),
    )..addListener(_tick);

    if (widget.enabled) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant AnimatedTechBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) {
      if (widget.enabled) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _ensureInitializedFor(Size size) {
    if (_lastSize == size && _nodes.isNotEmpty && _atoms.isNotEmpty) return;

    _lastSize = size;
    _nodes.clear();
    _atoms.clear();
    _trail.clear();

    final area = size.width * size.height;
    final nodeCount = (area / 48000).clamp(18, 52).toInt();

    for (int i = 0; i < nodeCount; i++) {
      _nodes.add(
        _Node(
          pos: Offset(
            _rng.nextDouble() * size.width,
            _rng.nextDouble() * size.height,
          ),
          vel: Offset(
            (_rng.nextDouble() - 0.5) * 0.7,
            (_rng.nextDouble() - 0.5) * 0.7,
          ),
          radius: 1.1 + _rng.nextDouble() * 2.0,
          hueMix: _rng.nextDouble(),
        ),
      );
    }

    final atomCount = size.width < 700 ? 2 : 3;
    for (int i = 0; i < atomCount; i++) {
      final center = Offset(
        size.width * (0.18 + i * 0.32) + (_rng.nextDouble() * 30 - 15),
        size.height * (0.20 + _rng.nextDouble() * 0.45),
      );
      _atoms.add(
        _Atom(
          center: center,
          baseRadius: 26 + _rng.nextDouble() * 24,
          orbitCount: 3,
          phase: _rng.nextDouble() * pi * 2,
          speed: 0.35 + _rng.nextDouble() * 0.55,
        ),
      );
    }
  }

  void _tick() {
    if (!mounted) return;

    final nowMs = _controller.lastElapsedDuration?.inMilliseconds ?? 0;

    for (final n in _nodes) {
      n.pos += n.vel;

      if (n.pos.dx < 0 || n.pos.dx > _lastSize.width) {
        n.vel = Offset(-n.vel.dx, n.vel.dy);
        n.pos = Offset(n.pos.dx.clamp(0, _lastSize.width), n.pos.dy);
      }
      if (n.pos.dy < 0 || n.pos.dy > _lastSize.height) {
        n.vel = Offset(n.vel.dx, -n.vel.dy);
        n.pos = Offset(n.pos.dx, n.pos.dy.clamp(0, _lastSize.height));
      }
    }

    if (_hasPointer && _lastPointer.dx > -9000) {
      _pointerVelocity = _pointer - _lastPointer;
    } else {
      _pointerVelocity = Offset.zero;
    }
    _lastPointer = _pointer;

    for (final p in _trail) {
      p.pos += p.vel;
      p.vel = p.vel * 0.98;
    }
    _trail.removeWhere((p) => nowMs - p.birthMs > p.lifeMs);

    if (_hasPointer && _pointer.dx > -9000) {
      final speed = _pointerVelocity.distance;
      final emit = (1 + (speed / 10)).clamp(1, 7).toInt();

      for (int i = 0; i < emit; i++) {
        final jitter = Offset(
          (_rng.nextDouble() - 0.5) * 10,
          (_rng.nextDouble() - 0.5) * 10,
        );

        _trail.add(
          _TrailParticle(
            pos: _pointer + jitter,
            vel: Offset(
                  (_rng.nextDouble() - 0.5) * 0.7,
                  (_rng.nextDouble() - 0.5) * 0.7,
                ) +
                _pointerVelocity * 0.03,
            birthMs: nowMs,
            lifeMs: 650 + _rng.nextInt(500),
            radius: 1.2 + _rng.nextDouble() * 2.3,
          ),
        );
      }
    }

    setState(() {});
  }

  void _onPointerMove(Offset localPos) {
    _hasPointer = true;
    _pointer = localPos;
  }

  void _onPointerExit() {
    _hasPointer = false;
    _pointer = const Offset(-9999, -9999);
    _lastPointer = const Offset(-9999, -9999);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        _ensureInitializedFor(size);

        final nowMs = _controller.lastElapsedDuration?.inMilliseconds ?? 0;

        return Listener(
          onPointerHover: (e) => _onPointerMove(e.localPosition),
          onPointerDown: (e) => _onPointerMove(e.localPosition),
          onPointerMove: (e) => _onPointerMove(e.localPosition),
          onPointerCancel: (_) => _onPointerExit(),
          child: MouseRegion(
            onExit: (_) => _onPointerExit(),
            child: Stack(
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(-0.7, -0.85),
                        radius: 1.25,
                        colors: [
                          cs.primary.withOpacity(0.18),
                          cs.secondary.withOpacity(0.08),
                          cs.background,
                        ],
                        stops: const [0, 0.4, 1],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -140,
                  top: -140,
                  child: Container(
                    width: 320,
                    height: 320,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          cs.tertiary.withOpacity(0.16),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: CustomPaint(
                      painter: _TechPainter(
                        t: _controller.value * 2 * pi,
                        nowMs: nowMs,
                        nodes: _nodes,
                        atoms: _atoms,
                        pointer: _pointer,
                        hasPointer: _hasPointer,
                        trail: _trail,
                        colorPrimary: cs.primary,
                        colorSecondary: cs.secondary,
                        outline: cs.outline,
                      ),
                    ),
                  ),
                ),
                widget.child,
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TechPainter extends CustomPainter {
  final double t;
  final int nowMs;
  final List<_Node> nodes;
  final List<_Atom> atoms;
  final Offset pointer;
  final bool hasPointer;
  final List<_TrailParticle> trail;

  final Color colorPrimary;
  final Color colorSecondary;
  final Color outline;

  _TechPainter({
    required this.t,
    required this.nowMs,
    required this.nodes,
    required this.atoms,
    required this.pointer,
    required this.hasPointer,
    required this.trail,
    required this.colorPrimary,
    required this.colorSecondary,
    required this.outline,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final maxDist = min(size.shortestSide * 0.30, 160.0);

    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final nodePaint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < nodes.length; i++) {
      final a = nodes[i];

      for (int j = i + 1; j < nodes.length; j++) {
        final b = nodes[j];
        final d = (a.pos - b.pos).distance;

        if (d < maxDist) {
          final k = 1 - (d / maxDist);
          final wave = 0.55 + 0.45 * sin(t + (i + j) * 0.12);
          final alpha = (k * wave * 0.30).clamp(0.0, 0.30);

          linePaint.color = outline.withOpacity(alpha);
          canvas.drawLine(a.pos, b.pos, linePaint);
        }
      }
    }

    for (int i = 0; i < nodes.length; i++) {
      final n = nodes[i];
      final glow = 0.20 + 0.12 * sin(t + i * 0.3);

      nodePaint.color = Color.lerp(colorPrimary, colorSecondary, n.hueMix)!
          .withOpacity(glow.clamp(0.14, 0.30));
      canvas.drawCircle(n.pos, n.radius, nodePaint);
    }

    for (int i = 0; i < atoms.length; i++) {
      final atom = atoms[i];
      final center = atom.center;

      final nucleusGlow = Paint()
        ..color = colorPrimary.withOpacity(0.12)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
      canvas.drawCircle(center, 12, nucleusGlow);

      final nucleusCore = Paint()..color = colorPrimary.withOpacity(0.38);
      canvas.drawCircle(center, 3.6, nucleusCore);

      for (int o = 0; o < atom.orbitCount; o++) {
        final orbitR = atom.baseRadius + o * 11.0;
        final angle = atom.phase + t * atom.speed + o * 1.6;

        final orbitPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = outline.withOpacity(0.18);

        canvas.save();
        canvas.translate(center.dx, center.dy);
        canvas.rotate(o * 0.75 + i * 0.35);

        final rect = Rect.fromCenter(
          center: Offset.zero,
          width: orbitR * 2.3,
          height: orbitR * 1.25,
        );
        canvas.drawOval(rect, orbitPaint);

        final ex = (orbitR * 1.15) * cos(angle);
        final ey = (orbitR * 0.62) * sin(angle);

        final eGlow = Paint()
          ..color =
              Color.lerp(colorSecondary, colorPrimary, o / atom.orbitCount)!
                  .withOpacity(0.52)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7);
        canvas.drawCircle(Offset(ex, ey), 3.1, eGlow);

        final eCore = Paint()
          ..color =
              Color.lerp(colorSecondary, colorPrimary, o / atom.orbitCount)!
                  .withOpacity(0.92);
        canvas.drawCircle(Offset(ex, ey), 1.5, eCore);

        canvas.restore();
      }
    }

    if (hasPointer && pointer.dx > -9000) {
      final halo = Paint()
        ..color = colorPrimary.withOpacity(0.12)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 34);
      canvas.drawCircle(pointer, 80, halo);

      final core = Paint()
        ..color = colorPrimary.withOpacity(0.55)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
      canvas.drawCircle(pointer, 13, core);

      final dot = Paint()..color = colorPrimary.withOpacity(0.95);
      canvas.drawCircle(pointer, 2.3, dot);

      for (final p in trail) {
        final lifeK = p.lifeK(nowMs);
        final col = Color.lerp(colorSecondary, colorPrimary, lifeK)!
            .withOpacity(0.28 * lifeK);

        final paint = Paint()
          ..color = col
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

        canvas.drawCircle(
          p.pos,
          p.radius * (0.9 + 0.7 * lifeK),
          paint,
        );
      }

      final connectPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;

      const pointerMax = 180.0;
      for (final n in nodes) {
        final d = (n.pos - pointer).distance;
        if (d < pointerMax) {
          final k = 1 - (d / pointerMax);
          connectPaint.color =
              colorPrimary.withOpacity((0.18 * k).clamp(0.0, 0.18));
          canvas.drawLine(pointer, n.pos, connectPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _TechPainter oldDelegate) => true;
}

class _Node {
  Offset pos;
  Offset vel;
  final double radius;
  final double hueMix;

  _Node({
    required this.pos,
    required this.vel,
    required this.radius,
    required this.hueMix,
  });
}

class _Atom {
  final Offset center;
  final double baseRadius;
  final int orbitCount;
  final double phase;
  final double speed;

  _Atom({
    required this.center,
    required this.baseRadius,
    required this.orbitCount,
    required this.phase,
    required this.speed,
  });
}

class _TrailParticle {
  Offset pos;
  Offset vel;
  final int birthMs;
  final int lifeMs;
  final double radius;

  _TrailParticle({
    required this.pos,
    required this.vel,
    required this.birthMs,
    required this.lifeMs,
    required this.radius,
  });

  double lifeK(int nowMs) {
    final age = (nowMs - birthMs).clamp(0, lifeMs);
    return 1 - (age / lifeMs);
  }
}
