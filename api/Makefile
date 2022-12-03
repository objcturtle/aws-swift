all: image api

image:
	docker build -t swift-lambda .

api:
	docker run --rm --volume "$(CURDIR)/:/src" --workdir "/src/" swift-lambda swift build --product api -c release -Xswiftc -static-stdlib
	chmod +x scripts/package.sh
	scripts/package.sh api
