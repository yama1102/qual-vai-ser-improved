import consumer from "./consumer";

const initGroupCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.groupId;
    // console.log(id)
    consumer.subscriptions.create({ channel: "GroupChannel", id: id },
    {
      received(data) {
        // console.log(data);
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initGroupCable };
