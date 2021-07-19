import React, { useContext, useEffect, useState } from 'react';
import LandingPage from './LandingPage';

export const LandingPageContext = React.createContext()

const LandingPageProvider = ({ hotels }) => {
	return (
		<LandingPageContext.Provider>
			<LandingPage hotels={hotels} />
		</LandingPageContext.Provider>
	)
}

export default LandingPageProvider
