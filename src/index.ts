import http from 'node:http';

const PORT = 3000;

const server = http.createsServer((request, response) => {
  console.log('Request received', request.url);
  response.end('Hello World');
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
