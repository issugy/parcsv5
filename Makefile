all: build

clean:
	rm -rf target

build:
	mvn clean package

run:
	mvn exec:java -Dexec.mainClass="org.example.Main"

.PHONY: clean build run