import React from 'react';
import { Row } from 'react-bootstrap';
import WalletList from '../../Components/WalletList';

const WalletsPage = () => {
    return (
        <Row>
            {/* <Col sm={6} md={6}> */}
                <WalletList/>
            {/* </Col>             */}
        </Row>
    )
}

export default WalletsPage;