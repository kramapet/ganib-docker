# ganib-docker
Ganib 5.0 - Dockerfile

Build image:
```sh
% docker build -t ganib:5.0 .
```

Create container:
```sh
% docker create --name=ganib -p 8080:8080 ganib:5.0
```

Start container:
```sh
% docker start ganib
```

Access ganib at ```http://localhost:8080/ganib```
