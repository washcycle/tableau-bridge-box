The following CMD args must be specified at runtime:

--patTokenId
--userEmail
--client
--site
--patTokenFile
--poolId (Optional)

Additionally, you must mount your PatTokenFile. The format is descrbied below

```
{
    "patTokenId": "uLICC7e8SUS8ZNGe8RIFn4u==:lRihmYHI0XBKle7e8S4uSORXGqAkAl4"
}
```

"patTokenId" is arbitrary, as long as `--patTokenId` and the key in the PatTokenFile match it will work


# Test Locally in Docker

`docker run --rm --network="host" --env-file .env -v $(pwd)/patToken.json:/mnt/patToken.json tableaubridgetrino:latest`