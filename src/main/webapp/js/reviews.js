function openReviewModal() {
    document.getElementById('reviewModal').style.display = 'flex';
}

function closeReviewModal() {
    document.getElementById('reviewModal').style.display = 'none';
}

window.addEventListener('click', function(e) {
    const modal = document.getElementById('reviewModal');
    if (e.target === modal) {
        closeReviewModal();
    }
});