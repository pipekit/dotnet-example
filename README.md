# .NET CI Example using Argo Workflows

This example uses Argo Workflows to build and test a simple .NET Core application.

![image](https://github.com/user-attachments/assets/e55437a8-dfdd-4f43-bde3-76f16264dbba)

## Steps
1. Checks out the code from this repo to a PVC in kubernetes
2. Injects a specially formatted docker authentication file to allow later steps to push to a private docker registry
3. Builds the .NET Core application in a docker container
4. Gets the specific digest of that built container so that we can run it in CI to prove that it built
5. Runs that built container and executes `dotnet test` to run the tests and ensure they pass.


## Notes
- In reality, it would be more common to include the `dotnet test` command as part of the dockerfile so that it is tested before being built and pushed to the registry. Therefore steps 3-5 would be one step.
- All images are tagged with `:latest` for the purpose of this demo. In a real-world scenario, you would tag your images with a specific version number.
- There is no nuget cache in play here so sometimes the builds fail due to rate limiting. They are set to auto-retry the builds a few times before failing so you may see a few failures before it succeeds.
- We are building on arm64 for the purposes of cost efficiency. This should run fine on AMD64 as well.

The Pipe URL for this repo is https://pipekit.io/pipes/da4c97b4-847e-4d1d-b0c3-e17da2c99827
