<script>
function fetchData() {
    event.preventDefault();
    const question = document.getElementById('question').value;
    const formData = new FormData();
    formData.append('question', question);

        fetch('index.php', {
            method: 'POST',
            body: formData
        })
    .then(response => response.text())
    .then(data => {
        document.getElementById('result').innerHTML = data;
    });
}
</script>