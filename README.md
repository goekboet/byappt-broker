# broker
1. Hardcode responses from all endpoints
2. Dockerize
3. Implement frontend
4. Implement bookings
5. Dockerize with db
6. implement frontend
7. Start work on oAuth

`GET /hosts`
```
[
    {
        "HostId": "SomeId",
        "HostFriendlyName": "SomeFriendlyName",
        "BusinessDayStart": "PIT 00:00"
    }
]
```

`GET /host/{hostId}/appointments`
- schedule decides what client claims are necessary
```
[
    {
        "Id": "A hash of the Host and appointment"
        "Host": "HostId", 
        "Appointment": "(DatetimeOffset start, DateTimeOffset dur)"
    },
    ...
]
```

`POST /bookings/{appointmentId}`
- userId in token
- in body a 

if successful:
* removes appointment from any GET to this api
* gives this user a claim to the appointment that can be exchanged for a video-token

fails 

```
GET /bookings
[
    {
        "Id": "A hash of the Host and appointment"
        "Host": "Friendly name host", 
        "Appointment": "(DatetimeOffset start, DateTimeOffset dur)",
        "BusinessDayStart": "Point in time businessday 00:00"
    }
]
```
- in ascending order appointment start