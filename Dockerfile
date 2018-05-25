FROM meitu/android:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

ENV ANDROID_NDK_HOME /opt/android-sdk/ndk-bundle

ENV PATH ${PATH}:${ANDROID_NDK_HOME}

ENV ANDROID_NDK_VERSION r17

RUN mkdir -p $ANDROID_NDK_HOME \
        && cd /tmp \
        && wget -q https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip \
        && unzip android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip \
        && mv -f android-ndk-${ANDROID_NDK_VERSION}/* $ANDROID_NDK_HOME \
        && rm -rf /tmp/*

# Cleanup
RUN apt-get clean -y && apt-get autoremove -y \
 && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace