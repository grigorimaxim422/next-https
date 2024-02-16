import React from 'react';
import BotList from "../../Components/BotList";
import BotPane from "../../Components/BotPane";
import { Col, Container, Row } from 'react-bootstrap';
const HomePage = ({ logout = () => { } }) => {
    return (
        <Row>
            <Col sm={6} md={3}>
                    <BotList/>
            </Col>
            <Col sm={6} md={9}>
                    <BotPane/>
            </Col>
        </Row>                    
    );
}
export default HomePage