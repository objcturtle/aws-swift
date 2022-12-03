set-profile:
	chmod +x scripts/profile.swift
	scripts/profile.swift $(PROFILE)

deploy:
	cd api; make;
	sls deploy

update:
	cd api; make api;
	sls deploy function -f api