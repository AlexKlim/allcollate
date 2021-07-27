
import { makeStyles } from '@material-ui/core/styles';

export const useStyles = makeStyles({
	cardLink: {
		height: '276px',
		width: '300px',
	},
	cardBody: {
		height: '276px',
		width: '300px',
		background: props => `url(${props.backgroundUrl})`,
		display: 'flex',
    flexDirection: 'column',
		marginTop: '23px',
	},
	featureContainer: {
		padding: '40px 0',
	},
	hotelNameContainer: {
		padding: '10px 0',
		background: 'rgba(92, 115, 194, 0.9)',
		display: 'flex',
		alignItems: 'center',
		justifyContent: 'center',
		color: '#FFFFFF'
	},
	hotelPriceContainer: {
		height: '100%',
    display: 'flex',
    flexDirection: 'column',
    alignContent: 'flex-end',
    justifyContent: 'flex-end',
    alignItems: 'flex-end',
	},
	hotelPrice: {
		padding: '10px',
		background: 'rgba(92, 115, 194, 0.9)',
		borderTopLeftRadius: '4px',
		borderBottomRightRadius: '4px',
		display: 'flex',
		alignItems: 'center',
		textAlign: 'center',
		justifyContent: 'center',

		color: '#FFFFFF'
	},
	hotelCardsRow: {
		borderTop: '1px solid #B2B2B2',
		borderBottom: '1px solid #B2B2B2',
		backgroundColor: "white",
	},
	emptyRow: {
		backgroundColor: "#f8f9fa",
		height: "170px",
	},
	beta: {
		marginLeft: '5px',
    fontSize: '16px'
	},
	titleBlockWithBeta: {
		display: 'inline-flex'
	}
});