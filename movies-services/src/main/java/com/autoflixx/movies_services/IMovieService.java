package com.autoflixx.movies_services;

import java.util.List;

public interface IMovieService {
    List<MovieModel> getAllMovies();

    MovieModel getMovieById(Integer idMovie);

    MovieModel saveMovie(MovieModel movie);

    void deleteMovie(Integer idMovie);

    MovieModel updateMovie(MovieModel movie);

}
