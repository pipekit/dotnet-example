# dotnet-example

This example uses Argo Workflows to build and test a simple .NET Core application.

## Steps
1. Checks out the code from this repo to a PVC in kubernetes
2. Injects a specially formatted docker authentication file to allow later steps to push to a private docker registry
3. Builds the .NET Core application in a docker container
4. Gets the specific digest of that built container so that we can run it in CI to prove that it built
5. Runs that built container and executes `dotnet test` to run the tests and ensure they pass.

In reality, it would be more common to include the `dotnet test` command as part of the dockerfile so that it is tested before being built and pushed to the registry. Therefore steps 3-5 would be one step.
