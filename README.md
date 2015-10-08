# docker-vault

As lightweight as possible (~35mb) container for [`vault`](https://vaultproject.io).

Current version: 0.3.1

Instead of building `vault` with `go` we are using the pre-compiled binary provided by the upstream, and checking it with the `sha256sum` gave by them during build-time of the container.

## LICENSE
© 2015, Jose-Luis Rivas `<me@ghostbar.co>`.

This is licensed under the MIT-license terms. Find a copy on `LICENSE`.
