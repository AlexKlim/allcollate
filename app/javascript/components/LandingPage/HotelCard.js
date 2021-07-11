import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import clsx from 'clsx';
import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardMedia from '@material-ui/core/CardMedia';
import CardContent from '@material-ui/core/CardContent';
import CardActions from '@material-ui/core/CardActions';
import Collapse from '@material-ui/core/Collapse';
import Avatar from '@material-ui/core/Avatar';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import { red } from '@material-ui/core/colors';
// import FavoriteIcon from '@material-ui/icons/Favorite';
// import ShareIcon from '@material-ui/icons/Share';
// import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
// import MoreVertIcon from '@material-ui/icons/MoreVert';

const useStyles = makeStyles((theme) => ({
    root: {
        maxWidth: 345,
    },
    media: {
        height: 0,
        paddingTop: '56.25%', // 16:9
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
    avatar: {
        backgroundColor: red[500],
    },
}));


export default function HotelCard() {
    const classes = useStyles();
    const [expanded, setExpanded] = React.useState(false);

    const handleExpandClick = () => {
        setExpanded(!expanded);
    };

    return (
        <Card className={classes.root} style={{ width: '234px', height: '220px', borderRadius: '4px', background: 'url(http://pix5.agoda.net/hotelimages/38/38/38_120516001857736.jpg?s=312x)' }}>
            <div style={{
                width: '234px',
                height: '45px',
                background: 'rgba(92, 115, 194, 0.9)',
                // opacity: '0.5'
            }}>

            </div>
            <div style={{
                width: '45px',
                height: '45px',
                marginLeft: '189px',
                marginTop: '130px',
                background: 'rgba(92, 115, 194, 0.9)',
                borderTopLeftRadius: '4px',
                borderBottomRightRadius: '4px',
                // opacity: '0.5'
            }}>
            </div>
        </Card>
    );
}
