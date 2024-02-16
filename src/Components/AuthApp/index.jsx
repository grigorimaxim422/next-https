import React from 'react';
import BotList from "../BotList";
import { Col, Container, Row, Tab, Tabs } from 'react-bootstrap';
import Header from '../Header';
import "./index.css";
import BotMessageList from '../BotMessageList';
import WalletsPage from '../WalletsPage';
import { useBotsContext } from '../../lib';

const AuthApp = ({ logout = () => { } }) => {    
    const { refreshBalanceList } = useBotsContext();

    const handleTabChanged = (selectedTab) => {        
        if (selectedTab === 'wallet') {            
            refreshBalanceList();
        }    
    }

    return (        
        <>
            <header  className="sticky-top">
                <Container>
                    <Header logout={logout} />   
                </Container>
            </header>
            <section id="name">            
                <div className='container-fluid '>
            <Tabs defaultActionKey="home" id="pages" onSelect={handleTabChanged}>
                <Tab eventKey="home" title="Home">
                    <HomePage/>       
                </Tab>
                <Tab eventKey="wallet" title="Wallet">
                    <WalletsPage/>        
                </Tab>
            </Tabs>
            </div>
            </section>        
        </>
        
    );
}

const HomePage = () => {
    return (                    
                    <Row>
                        <Col sm={6} md={4} className="">
                            <div className='overlap-container'>
                                <BotList />
                            </div>
                        </Col>
                        <Col sm={6} md={8}>                            
                                <BotMessageList />                            
                        </Col>
                    </Row>
                
    )
}
export default AuthApp;