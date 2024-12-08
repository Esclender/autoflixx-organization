package com.autoflixx.movies_services;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieServiceImpl implements IMovieService {

    @Autowired
    private MovieRepository movieRepository;

    @Override
    public List<MovieModel> getAllMovies() {
        List<MovieModel> movieList = new LinkedList<>();
        movieRepository.findAll().forEach(movieList::add);
        return movieList;
    }

    @Override
    public MovieModel getMovieById(Integer idMovie) {
        return movieRepository.findById(idMovie).get();
    }

    @Override
    public MovieModel saveMovie(MovieModel movie) {
        return movieRepository.save(movie);
    }

    @Override
    public void deleteMovie(Integer idMovie) {
        movieRepository.deleteById(idMovie);
    }

    @Override
    public MovieModel updateMovie(MovieModel movie) {
        return movieRepository.save(movie);
    }

}
