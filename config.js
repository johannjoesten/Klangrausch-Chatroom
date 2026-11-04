// config.js – Supabase-Zugangsdaten

const SUPABASE_URL = 'https://izgnfwfnvgvthgvkkifl.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6Z25md2Zudmd2dGhndmtraWZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTM2NDY5NDgsImV4cCI6MjEwOTIyMjk0OH0.gbwFDqjErcvr0yl5RAnZT8kzZi6TtyOl3Twa2ce4qOk';

const db = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY);
