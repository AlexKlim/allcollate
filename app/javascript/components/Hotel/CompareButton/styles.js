import { makeStyles } from '@material-ui/core/styles'

export const useStyles = makeStyles({
  link: {
    backgroundColor: '#5C73C2',
    color: 'white',
    '&:hover': {
      color: 'white',
      backgroundColor: '#5C73C2',
      opacity: '0.8'
    }
  }
})