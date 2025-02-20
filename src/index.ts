// import { loadEnvFile, } from 'node:process';

import { openConnection } from './db.js';
import { ManageGeneres } from './generes.js';
import { ManageMovies } from './movies.js';
process.loadEnvFile('.env');

try {
  const connection = await openConnection();
  const manageGeneres = new ManageGeneres(connection);
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
  // connection.end();

  const connection = await openConnection();
  const manageMovies = new ManageMovies(connection);
  const movies = await manageMovies.getAllMovies();
  console.log(generes);
} catch (error) {
  if (error instanceof Error) {
    console.error(error);
  } else {
    console.error(error);
  }
}
