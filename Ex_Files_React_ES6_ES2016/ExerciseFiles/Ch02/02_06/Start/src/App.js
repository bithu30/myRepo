import React, { Component } from 'react'
import {Markup, Editor, Container, Column, Row, RuleInput, RuleLabel, StyleInput, Button, Document} from './styled'

class App extends Component {

  state = {
    editor: "",
    name0: "",
    begin0: "",
    end0: "",
    style0: "",
    rules: 1
  }

  handleChange = (event) => {
    let {name, value} = event.target
    this.setState({
      [name]: value
    })
  }

    rules = () => {
    let {rules} = this.state
    let array = []
    let fields = ['name', 'begin', 'end']
    for (let i = 0; i < rules; i++) {
      array.push(
        <Row
          key={i}
        >
          <Column>
            {fields.map( (field, index) => {
              return (
                <Column
                  key={index}
                >
                  <RuleLabel>
                    {field}
                  </RuleLabel>
                  <RuleInput
                    value={this.state[`${field}${i}`]}
                    onChange={this.handleChange}
                    name={`${field}${i}`}
                  />
                </Column>
              )
            })}
          </Column>
          <StyleInput
            value={this.state[`style${i}`]}
            onChange={this.handleChange}
            name={`style${i}`}
          />
        </Row>
      )
    }

    return array
  }
  
  newFields = () => {
    this.setState( (prevState) => {
      let {rules} = prevState
      let fields = ['name', 'begin', 'end', 'style']
      let inputValues = {}
      fields.forEach( (field) => {
        inputValues = {
          ...inputValues,
          [`${field}${rules}`]: ''
        }
      })
      rules++
      console.log({
        rules,
        ...inputValues
      })
      return {
        rules,
        ...inputValues
      }
    })
  }


  render() {
    let {value} = this.state
    let {handleChange, newFields} = this
    return (
      <Container>
        <Column>
          <Button
            onClick={newFields}
          >
            New Rule
          </Button>
        </Column>
        <Column>
          <Button>
            Random Text
          </Button>
          <Document>
            <Editor
              name={"Editor"}
              value={value}
              onChange={handleChange}
            />
            <Markup/>
          </Document>
        </Column>
      </Container>
    )
  }
}

export default App
