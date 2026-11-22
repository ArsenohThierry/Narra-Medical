javac -Xlint -cp "lib/narrafw.jar" -d test $(find . -name "*.java")
java -cp "lib/narrafw.jar:test" main.java.Main

rm -Rf test