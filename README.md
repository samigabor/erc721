## ERC721

### test
- `forge test --fork-url $RPC_URL`

### Encoding svg
- encoded svg: `base64 -i <svg-path>`
- view it in browser: `data:image/svg+xml;base64,` + enocded svg

example:

Text svg:
```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="50">
  <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle" font-family="Arial" font-size="16" fill="orange">
    Fun Fun Foundry
  </text>
</svg>
```
Base64 encoded svg:
```
PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIGhlaWdodD0iNTAiPgogIDx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBkb21pbmFudC1iYXNlbGluZT0ibWlkZGxlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTYiIGZpbGw9Im9yYW5nZSI+CiAgICBGdW4gRnVuIEZvdW5kcnkKICA8L3RleHQ+Cjwvc3ZnPg==
```
Image URI:
```
data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIGhlaWdodD0iNTAiPgogIDx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBkb21pbmFudC1iYXNlbGluZT0ibWlkZGxlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTYiIGZpbGw9Im9yYW5nZSI+CiAgICBGdW4gRnVuIEZvdW5kcnkKICA8L3RleHQ+Cjwvc3ZnPg==
```
