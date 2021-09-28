FROM qmcgaw/latexdevcontainer

USER root

RUN apt-get update -y --allow-releaseinfo-change && \
    apt-get install -y --no-install-recommends curl imagemagick ghostscript hunspell hunspell-en-us && \
    mkdir -p /root/.config/Code/Dictionaries && \
    ln -s /usr/share/hunspell/* /root/.config/Code/Dictionaries

COPY shell/make-snapshot.sh shell/send-snapshot.sh /usr/local/bin/

RUN sed -e 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read" pattern="PDF" \/>/' -i /etc/ImageMagick-6/policy.xml

USER ${USERNAME}

RUN tlmgr update --self && \
    tlmgr install stix xcolor enumitem thmtools preview \
                  mdframed etoolbox zref needspace && \
    texhash