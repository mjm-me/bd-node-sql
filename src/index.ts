// import { loadEnvFile, } from 'node:process';

import { openConnection } from './db.js';
import { SqlError } from './entities.js';
import { ManageGeneres } from './generes.js';
import { ManageMovies } from './movies.js';
process.loadEnvFile('.env');

try {
    const connection = await openConnection();
    const manageGeneres = new ManageGeneres(connection);
    const manageMovies = new ManageMovies(connection);
    const generes = await manageGeneres.getAllGeneres();
    console.log(generes);
    // const result = await createGenere('War');
    // console.log(result);
    // const result2 = await updateGenere(25, 'Drama');
    // console.log(result2);
    // for (let i = 14; i < 29; i++) {
    //     const result = await deleteGenere(i);
    //     console.log(result);
    // }

    const movies = await manageMovies.getAllMoviesWithGenere();
    console.log(movies);

    const newMovie = await manageMovies.createMovie({
        title: 'The Godfather 3: The Godfather Coda',
        year: 2020,
        director: 'Francis Ford Coppola',
        duration: 162,
        poster: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1h7t2f9Y9E5x7v5jRl3h2B2jYw8.jpg',
        rate: 7.0,
    });
    console.log({ newMovie });

    const updatedMovie = await manageMovies.updateMovieById(newMovie.id, {
        title: 'The Godfather 3: The Godfather Coda - The Death of Michael Corleone',
        year: 2021,
        director: 'Francis F. Coppola',
        // duration: 162,
        // poster: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1h7t2f9Y9E5x7v5jRl3h2B2jYw8.jpg',
        rate: 7.1,
    });
    console.log({ updatedMovie });

    const deletedMovie = await manageMovies.deleteMovieById(newMovie.id);
    console.log({ deletedMovie });

    const findMovie = await manageMovies.findMovieWithGeneresByTitle(
        'The Lord of the rings: The Fellowship of the Ring',
    );
    console.log(findMovie);

    // Add genere to movie
    await manageMovies.changeMovieGeneres(findMovie.id, ['Comedy']);

    // Remove genere from movie
    await manageMovies.changeMovieGeneres(findMovie.id, ['Comedy']);

    connection.end();
} catch (error) {
    if ('message' in (error as Error) && (error as Error).message !== '') {
        const e = error as SqlError;
        console.error(e.name, e.message);
        console.log(e.code, 'errno:', e.errno, 'sqlState:', e.sqlState);
    } else {
        console.error(error);
    }
}