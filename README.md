
# Link Tracker Application

## Overview

My app simplifies link tracking, making it ideal for evaluating digital engagement. It's built on clean, tested code, ensuring reliability. Designed for ease and efficiency, it generates trackable shortened URLs. 

Some 'cheats' that I used in the home assignment:
- Github Copilot ( only to auto complete some methods or variables )
- Github Copilot to generate bases of rspec files ( fixed inconsistencies and some small tests by myself )


## Technologies used
```
ruby 3.2.2 ( [yjti enabled](https://github.com/Shopify/yjit) )
rails 7.1.2
responders
browser
geoip
figaro
sqlite3
ruby-lsp
rspec
rubocop
factory_bot_rails
simplecov
```

## API Documentation

The API has been meticulously documented using Slate, offering enhanced readability and interpretation for users. This documentation provides a comprehensive guide, ensuring ease of use and accessibility for all potential API consumers.

[**https://breim.github.io/link_tracker_api_docs/**](https://breim.github.io/link_tracker_api_docs/)


## Running the tests

Just run inside the project folder:
```bash
rspec
```

You also can check the tests covarage using simplecov after running rspec:

```bash
open coverage/index.html
```

## Running locally

To enhance convenience, I have developed a compact Docker image.

Build:
```bash
docker build -f Dockerfile.dev -t link_tracker .
```

Run:
```bash
docker run -p 3000:3000 link_tracker
```

Open in your browser to redirect and save the access:
``http://localhost:3000/<TOKEN>``



## BONUS
  
I've integrated the GeoIP library and [Maxmind's database](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data) within the analytics functionality to capture and store geographical details such as latitude, longitude, city, state, and additional information based on IP addresses. However, when accessed via localhost in a development environment, Rails captures the IP address 127.0.0.1, leading to limited data retrieval. In contrast, in a production environment with a genuine IP address, the system is designed to successfully return a comprehensive set of information.

```json
[
	{
		"id": 3,
		"system_name": "macOS",
		"browser_name": "Chrome",
		"browser_version": "121.0.0.0",
		"referer": null,
		"country": null,
		"region": null,
		"city": null,
		"latitude": null,
		"longitude": null,
		"ip": "::1",
		"device": "mac",
		"created_at": "2024-02-11T22:33:00.106Z"
	},
	{
		"id": 4,
		"system_name": "macOS",
		"browser_name": "Chrome",
		"browser_version": "121.0.0.0",
		"referer": null,
		"country": null,
		"region": null,
		"city": null,
		"latitude": null,
		"longitude": null,
		"ip": "::1",
		"device": "mac",
		"created_at": "2024-02-11T22:36:11.708Z"
	},
]
```


## References

Materials and links I used for consulting during the project development:

[CounterCache Rails](https://blog.appsignal.com/2018/06/19/activerecords-counter-cache.html)

[Factory Bot Tutorial](https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorygirl)

[Rspec Rails models](https://remimercier.com/how-to-test-rails-models-with-rspec/)
