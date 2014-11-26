TEMPLATE = aux
NAME=ambience-sailorpinup
OTHER_FILES = \
        $${NAME}.ambience \
        sounds.index \
        images/* \
        sounds/* \
        translations/* \
        rpm/* \
        README

ambience.files = \
        $${NAME}.ambience \
        sounds.index
ambience.path = /usr/share/ambience/$${NAME}

images.files = images/*
images.path = $${ambience.path}/images

sounds.files = sounds/*
sounds.path = $${ambience.path}/sounds

TS_FILE = $$OUT_PWD/translations/$${NAME}.ts
EE_QM = $$OUT_PWD/translations/$${NAME}_eng_en.qm

ts.commands += lupdate $$IN_PWD/ -ts $$TS_FILE
ts.CONFIG += no_check_exist no_link
ts.output = $$TS_FILE
ts.input = .

ts_install.files = $$TS_FILE
ts_install.path = /usr/share/translations/source
ts_install.CONFIG += no_check_exist

# should add -markuntranslated "-" when proper translations are in place (or for testing)
engineering_english.commands += lrelease -idbased $$TS_FILE -qm $$EE_QM
engineering_english.CONFIG += no_check_exist no_link
engineering_english.depends = ts
engineering_english.input = $$TS_FILE
engineering_english.output = $$EE_QM

engineering_english_install.path = /usr/share/translations
engineering_english_install.files = $$EE_QM
engineering_english_install.CONFIG += no_check_exist

QMAKE_EXTRA_TARGETS += ts engineering_english

PRE_TARGETDEPS += ts engineering_english

INSTALLS += \
        ambience \
        images \
        sounds \
        ts_install \
        engineering_english_install
