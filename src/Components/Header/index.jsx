import React, { useEffect, useState } from 'react';
import { Badge, Button, Container, Form, FormControl, InputGroup, OverlayTrigger, Popover } from 'react-bootstrap';
import { useBotsContext } from '../../lib';
import BotNavBar from "../BotNavBar/BotNavBar";
const Header = ({logout=()=>{}}) => {
    const { lastupdated, bots, keyword, setKeyword, filtered, borings, setBorings } = useBotsContext();    
    const [formInput, setFormInput] = useState(keyword);        
    const [boringInput, setBoringInput] = useState(()=>borings.join("\n"));
    const [showPopover, setShowPopover] = useState(false);

    const handleSubmit = e => {
        e.preventDefault();
        setKeyword(formInput);
    }
    const handleChange = e => {
        setFormInput(e.target.value);
    }
    const handleClearFilter = e => {
        setFormInput('');
        setKeyword('');
    }
    
    const handleSave = () => {
        const _borings = boringInput.split("\n").filter(b=>b!=="");        
        setBorings(_borings);        
        setShowPopover(false);
    }
    useEffect(() => {
        if (borings !== null) {
            console.log('BoringInput=', borings);
            setBoringInput(borings.join("\n"));
        }
    }, [borings]);

    const popover = (
        <Popover id="boring" title="Popover" className='p-1'>                        
            <Form.Control
                as="textarea"
                rows={15}
                value={boringInput}
                onChange={e=>setBoringInput(e.target.value)}                    
            />
                <Button
                    type="button"
                variant="primary"   
                className="w-100"
                    onClick={handleSave}
                >
                    Save
                </Button>            
      </Popover>
    );

    return (
        <>
        <Container  className="container pt-3 d-flex justify-content-between">
            <div>            
                <div className='px-2'>                    
                    {bots.length >0 && <Badge pill={true} className="h4 p-2" style={{ fontSize: '1rem' }}>{bots.length}</Badge>}
                    {Boolean(lastupdated) && <span> Updated:&nbsp;{lastupdated}</span>}
                </div>
            </div>            
            <Form onSubmit={handleSubmit}>
                    <InputGroup className="mb-2">
                    
                <FormControl
                    type="text"
                            placeholder="Filter by Keyword"                            
                    className="my-0"
                    value={formInput}
                    onChange={handleChange}                    
                />
                <Button
                    onClick={handleClearFilter}
                            variant="primary"
                            className="h-100"                            
                        >
                    Clear Filter
                        </Button>                    
                        {
                            (Boolean(filtered) && keyword!=='') ? (
                                <div className='p-1 ' style={{width:'25vw'}}>Found {filtered.length} Bots - {filtered.length>0 && filtered[0].username}...</div>
                            ) :
                                (
                                    <div className='p-1 ' style={{width:'25vw'}}></div>
                                )
                        }
                </InputGroup>            
                
                </Form>            
                <div className='d-flex'>
                    <OverlayTrigger
                        trigger="click"
                        placement='bottom'
                        show={showPopover}
                        onToggle={setShowPopover}
                        overlay={popover}
                    >
                        <Button variant="info">Exclude</Button>
                    </OverlayTrigger>                    
                    <div className='px-1'/>
                    <Button variant="warning" onClick={logout}>Logout</Button>
                </div>                        
            </Container>
            <Container>
                <BotNavBar/>
            </Container>
            
        </>
    )
}

export default Header;