import React, { useContext, useEffect, useState } from 'react';
import LandingPage from './LandingPage';

export const LandingPageContext = React.createContext()

const LandingPageProvider = () => {
    return (
        <LandingPageContext.Provider>
            <LandingPage />
        </LandingPageContext.Provider>
    )
}

export default LandingPageProvider
