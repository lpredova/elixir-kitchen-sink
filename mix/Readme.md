# Mix

Mix is a build tool that ships with Elixir and provides tasks for creating, compiling, testing, debugging, managing dependencies, and much more.

```sh
mix new projectName
```

An --app option can be given in order to name the OTP application for the
project.

A --sup option can be given to generate an OTP application skeleton including a
supervision tree. Normally an app is generated without a supervisor and without
the app callback.