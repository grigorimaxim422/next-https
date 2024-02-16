import React from 'react';
import {  Badge, ListGroup } from 'react-bootstrap';
import { useBotsContext } from '../../lib';

const BotList = () => {
    const { bots, selectedBot,} = useBotsContext();
    
    return (                    
            <ListGroup style={{ overflowY: 'scroll', height: '100%' }}>                        
                {
                    bots.map((bot,idx) => 
                        <UserListItem user={bot} selected={Boolean(selectedBot)&&bot.uid===selectedBot.uid} key={idx} />
                    )
                }
            </ListGroup>        
    )
}

const UserListItem = ({ user, selected=false }) => {
    const { setSelectedBot} = useBotsContext();
    
    return (
        <ListGroup.Item onClick={() => setSelectedBot(user)}
            className="line-block"
            style={{
            cursor: 'pointer',
            backgroundColor: selected ? '#f7d0c0' : 'white'            
            }}            
        >            
                <div>{user.uid}{
                        user.unread > 0 &&
                        <Badge bg="danger" className="float-right">{user.unread}</Badge>
                    }</div>
            <div>
                    {user.contains>0 && <span className="text-danger h3">&#x2605;</span>}
                    <span style={{ fontWeight: 'bold' }}>{user.username ? `${user.username}  (${user.lanip})` : 'none'}</span>                    
                <span>{user.last_updated_time ?user.last_updated_time : '-'}</span>
                </div>
                            
        </ListGroup.Item>
    )
}
export default BotList