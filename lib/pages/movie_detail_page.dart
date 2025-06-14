import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: const Color(0xFF121212),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem grande
            movie.posterPath.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(height: 300),

            const SizedBox(height: 20),

            // Título
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            // Sinopse
            const Text(
              "Sinopse:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70),
            ),
            const SizedBox(height: 5),
            Text(
              movie.overview.isNotEmpty
                  ? movie.overview
                  : 'Descrição não disponível.',
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),

            const SizedBox(height: 20),

            // Informações Extras
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "⭐ Nota: ${movie.voteAverage.toStringAsFixed(1)}",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  "📅 Lançamento: ${movie.releaseDate}",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Divider(color: Colors.white30),

            const SizedBox(height: 10),

            // Outras infos (você pode adicionar ainda mais campos no model se quiser)
            Text(
              "Idioma Original: ${movie.originalLanguage.toUpperCase()}",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              "Popularidade: ${movie.popularity.toStringAsFixed(1)}",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              "Total de votos: ${movie.voteCount}",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
