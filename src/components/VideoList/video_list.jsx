import React from 'react';
import VideoListItem from './video_list_item';
import './video_list.css';

const VideoList = props => {
  let videos = props.videos.map(video => <VideoListItem {...video} key={video.etag} onVideoSelect={props.onVideoSelect} />);
  return (
    <ul className="video-list-wrapper">
      {videos}
    </ul>
  );
};

export default VideoList;