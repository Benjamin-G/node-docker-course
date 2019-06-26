docker run --mount src=C:\Users\brgey\Docker\docker-mastery-for-nodejs\assignment-mta\in,target=/in,type=bind --mount src=C:\Users\brgey\Docker\docker-mastery-for-nodejs\assignment-mta\out,target=/out,type=bind --env CHARCOAL_FACTOR=10 mta1


docker run --mount src=C:\Users\brgey\Docker\docker-mastery-for-nodejs\assignment-mta\in,target=/app/in,type=bind --mount src=C:\Users\brgey\Docker\docker-mastery-for-nodejs\assignment-mta\out,target=/app/out,type=bind --env CHARCOAL_FACTOR=2.3 mta1

docker run -v %cd%/in:/app/in -v %cd%/out:/app/out --env CHARCOAL_FACTOR=3.5 mta1