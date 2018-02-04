# BCC in Alpine

## Using Dockerfile

* Buildling image:

    ```
    docker build --tag alpine-bcc --file Dockerfile .
    ```

* Running container based on the image:

    ```
    docker run --name alpine-bcc -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined alpine-bcc ash
    ```

## Using Vagrantfile

* Run:

    ```
    vagrant up
    ```

* Repeat steps from the `Dockerfile`.
