
import { makeStyles } from '@material-ui/core/styles';

export const useStyles = makeStyles((theme) => ({
    root: {
        maxWidth: 345,
    },
    media: {
        height: 0,
        paddingTop: '56.25%',
    },
    expand: {
        transform: 'rotate(0deg)',
        marginLeft: 'auto',
        transition: theme.transitions.create('transform', {
            duration: theme.transitions.duration.shortest,
        }),
    },
    expandOpen: {
        transform: 'rotate(180deg)',
    },
    hotelNameContainer: {
        width: '234px',
        height: '45px',
        background: 'rgba(92, 115, 194, 0.9)',

        fontFamily: 'Roboto',
        fontStyle: 'normal',
        fontWeight: 'normal',
        fontSize: '20px',
        lineHeight: '23px',
        display: 'flex',
        alignItems: 'center',
        textAlign: 'center',
        justifyContent: 'center',

        color: '#FFFFFF'
    },
    hotelCurrentDateContainer: {
        width: '45px',
        height: '45px',
        marginLeft: '189px',
        marginTop: '130px',
        background: 'rgba(92, 115, 194, 0.9)',
        borderTopLeftRadius: '4px',
        borderBottomRightRadius: '4px',

        fontStyle: 'normal',
        fontWeight: 'normal',
        fontSize: '18px',
        lineHeight: '21px',
        display: 'flex',
        alignItems: 'center',
        textAlign: 'center',
        justifyContent: 'center',

        color: '#FFFFFF'
    },
    hotelCardsRow: {
        borderTop: '1px solid #B2B2B2',
        borderBottom: '1px solid #B2B2B2',
        paddingTop: '0px',
        height: '360px'
    }
}));