import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({super.key, required this.movie, required this.onTap});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isHovering = false;

  Matrix4 _getTransform() {
    if (isHovering) {
      return Matrix4.identity()..scale(1.02); // ✅ Leve aumento só de 2%
    } else {
      return Matrix4.identity();
    }
  }

  Color _getBackgroundColor() {
    return isHovering ? const Color(0xFF1A1A1A) : const Color(0xFF2A2A2A);
    // ✅ Muda levemente o fundo no hover (ficando mais escuro)
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: _getTransform(),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(12),
            boxShadow: isHovering
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3), blurRadius: 6)
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.movie.posterPath.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : const SizedBox(height: 300),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Center(
                  child: Text(
                    widget.movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
