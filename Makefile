all: build

clean:
	rm -rf out/*.jar out/*.class

out/parcs.jar: src/libs/parcs.jar
	mkdir -p out
	cp src/libs/parcs.jar out/parcs.jar

out/PerfectNumberCounter.jar: out/parcs.jar src/main/java/org/example/PerfectNumberChecker.java src/main/java/org/example/PerfectNumberCounter.java
	mkdir -p out
	javac -cp out/parcs.jar -d out src/main/java/org/example/PerfectNumberChecker.java src/main/java/org/example/PerfectNumberCounter.java
	jar cf out/PerfectNumberCounter.jar -C out org/example/PerfectNumberChecker.class -C out org/example/PerfectNumberCounter.class

out/ParcsJob.jar: out/parcs.jar src/main/java/org/example/Main.java
	mkdir -p out
	javac -cp out/parcs.jar -d out src/main/java/org/example/Main.java
	jar cf out/ParcsJob.jar -C out org/example/Main.class

build: out/parcs.jar out/PerfectNumberCounter.jar out/ParcsJob.jar

run: build
	java -cp 'out/parcs.jar:out/ParcsJob.jar' org.example.Main
