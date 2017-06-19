FROM meitu/android:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

ENV ANDROID_NDK_HOME /opt/android-sdk/ndk-bundle

ENV PATH ${PATH}:${ANDROID_NDK_HOME}

# Accept all licenses before installing components.
RUN yes | sdkmanager --licenses

# Android NDK
RUN sdkmanager "ndk-bundle"

# Cleanup
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace