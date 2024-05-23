```toml
name = 'students'
sortWeight = 1000000
id = '8eac579a-6b01-4e45-88ac-210191346918'
```

#### Pre-request Script

```js
jc.sendRequest({
    method: 'GET',
    url: 'https://httpbin.org/anything'
}).then(response => {
    console.log(response)
}).catch(error => {
    console.error(error)
})
const response = await jc.sendRequest({
    method: 'GET',
    url: 'https://httpbin.org/anything'
})
```
