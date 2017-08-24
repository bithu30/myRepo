
class Random {

  constructor(max = 1000, allowNegatives = true) {
    this.max = max
    this.allowNegatives = allowNegatives
  }

  randomInt(min, max) {
    if (max > this.max) {
      max = this.max
    }
    if (min < 0 && !this.allowNegatives) {
      min = 0
    }
    min = Math.ceil(min)
    max = Math.floor(max)
    return Math.floor(Math.random() * (max -min +1)) + min
  }
}

export const rando = new Random()

const shakespeareApi = "https://api.graph.cool/simple/v1/shakespeare"

let options = () => {
  return {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      query: `{
        allPoems(
          first: 1
          skip: ${rando.randomInt(0,160)}
        ) {
          title
          author
          lines
          text
        }
      }`
    })
  }
}
