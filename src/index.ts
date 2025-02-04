import { createServer } from 'node:http';
import type { IncomingMessage, ServerResponse } from 'node:http';
import 'dotenv/config';
import createDebug from 'debug';

const debug = createDebug('app:server');

const PORT = process.env.PORT || 3000;

const createHtmlString = (title: string, content?: string) => {
  `
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- metadatos: UX, SEO, Accesibilidad, Performance -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Ejemplo de uso básico del html">
    <meta name="keywords" content="HTML, Curso, web">
    <title>${title}</title>

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <style>
 
    </style>

</head>
<body>
    <h1>Página de inicio</h1>
<main>${content ? content : ''}</main>
</body>
</html>
`;
};

const appRouter = (request: IncomingMessage, response: ServerResponse) => {
  const { url, method } = request;

  if (!url) {
    response.statusCode = 404;
    response.end('Not found');
    return;
  }

  debug(method, url);

  switch (method) {
    case 'GET':
      response.statusCode = 200; //valor por defecto
      response.setHeader('Content-Type', 'text/html; charset=utf-8');
      response.end(createHtmlString('Node server', 'Página de inicio'));
      break;
    case 'POST':
    case 'PUT':
    case 'PATCH':
    case 'DELETE':
    default:
      response.statusCode = 405;
      response.setHeader('Content-Type', 'text/html; charset=utf-8');
      response.end('Method not allowed');
  }
};

const server = createServer(appRouter);

server.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
  debug(`Server running on http://localhost:${PORT}`);
});
