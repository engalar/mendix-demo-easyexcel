FROM mendix/rootfs:bionic

RUN mkdir -p /opt/mendix &&\
  cd /opt/mendix &&\\
  wget ttps://cdn.mendix.com/runtime/mxbuild-9.12.2.44241.tar.gz &&\
  tar -xzf mxbuild-9.12.2.44241.tar.gz &&\
  wget https://cdn.mendix.com/mx-buildpack/mono/mono-5.20.1.27-mx-ubuntu-bionic.tar.gz &&\
  tar -xzf mono-5.20.1.27-mx-ubuntu-bionic.tar.gz &&\
  wget https://cdn.mendix.com/mx-buildpack/AdoptOpenJDK-jdk-11.0.10-linux-x64.tar.gz &&\
  tar -xzf AdoptOpenJDK-jdk-11.0.10-linux-x64.tar.gz

WORKDIR /opt/mendix

ENTRYPOINT [ "./mono/bin/mono", "--config", "./mono/etc/mono/config", "modeler/mxbuild.exe", "--target=package", "--output=/tmp/model.mda", "--java-home=jdk-11.0.10+9", "--java-exe-path=jdk-11.0.10+9/bin/java"]


CMD [ "/project/Easyexcel.mpr" ]
