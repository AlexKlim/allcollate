import React from 'react';
import { Grid, GalleryCard } from "tabler-react";
import PageSectionHeader from './PageSectionHeader'

export default class HotelPhoto extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { hotelName, photos } = this.props;
    const sortedPhotos = photos.sort(photo => photo.order)

    return (
      <>
        {sortedPhotos.length > 0 && (
          <section>
            <PageSectionHeader title={`${hotelName} Images`} />
            <Grid.Row className="row-cards">
              {sortedPhotos.map((item, key) => (
                <Grid.Col sm={6} lg={4} key={key} className="gallery-grid-col">
                  <GalleryCard className="gallery-card">
                    <img src={item.url} />
                  </GalleryCard>
                </Grid.Col>
              ))}
            </Grid.Row>
          </section>
        )}
      </>
    );
  }
}
