const shakespeareApi = "https://api.graph.cool/simple/v1/shakespeare"

let options = () => {
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify({
    //we'll write this later
  })
}

function randomInt(min, max) {
  min = Math.ceil(min)
  max = Math.floor(max)
  return Math.floor(Math.random() * (max -min +1)) + min
}
