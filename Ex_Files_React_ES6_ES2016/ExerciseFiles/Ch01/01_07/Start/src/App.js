import React, { Component } from 'react'
import {Markup, Editor, Container, Column, Row, RuleInput, RuleLabel, StyleInput, Button, Document} from './styled'

class App extends Component {
  render() {
    return (
      <Container>
        <Column>
          <Button>
            New Rule
          </Button>
        </Column>
        <Column>
          <Button>
            Random Text
          </Button>
          <Document>
            <Editor/>
            <Markup/>
          </Document>
        </Column>
      </Container>
    )
  }
}

export default App
