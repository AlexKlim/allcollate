import { makeStyles } from '@material-ui/core/styles';

const useStyles = makeStyles({
  centerContent: {
    justifyContent: 'center'
  },
  loading: {
    opacity: '0.5'
  },
  locationChipsList: {
    display: 'flex',
    marginTop: '10px',
    flexWrap: 'wrap',
    '& > *': {
      margin: '5px 5px 5px 0',
    },
  },
  link: {
    backgroundColor: '#5C73C2',
    color: 'white',
    '&:hover': {
      color: 'white',
      backgroundColor: '#5C73C2',
      opacity: '0.8'
    }
  },
})

export default useStyles;