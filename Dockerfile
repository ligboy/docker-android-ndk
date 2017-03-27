FROM meitu/android:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

ENV ANDROID_NDK_HOME /opt/android-sdk/ndk-bundle

ENV PATH ${PATH}:${ANDROID_NDK_HOME}

RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential
# Accept all licenses before installing components.
RUN yes | sdkmanager --licenses

# Android NDK
RUN sdkmanager "ndk-bundle"
RUN sdkmanager "cmake;3.6.3155560"

# Cleanup
RUN apt-get clean -y && apt-get autoremove -y
RUN rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace